class UsersController < ApplicationController
  impressionist actions: [:show]

  def index
    @users = User.all.order(:id)
  end

  def show
    @user = User.find(params[:id])
    @pastes = @user.pastes.where('"pastes"."visibility" = 0 OR "pastes"."user_id" = ?',
                                 current_user)
    @total_paste_views = total_paste_views(@user)
  end

  private

  # TODO: Find a better way
  def total_paste_views(user)
    sql = ActiveRecord::Base.send(:sanitize_sql_array,
                                  [TOTAL_PASTE_VIEWS_SQL, user, current_user])
    result = ActiveRecord::Base.connection.execute(sql)
    result.field_values('count').first
  end

  # Selects the total view count of a users pastes.
  # If the user is viewing their own page it includes private and unlisted pastes,
  # otherwise it only includes public pastes
  TOTAL_PASTE_VIEWS_SQL = <<-END_OF_SQL
    SELECT COUNT(*) AS count
    FROM (
      SELECT DISTINCT
        impressionable_id,
        ip_address
      FROM impressions
      WHERE impressionable_type = 'Paste'
        AND impressionable_id IN (
          SELECT pastes.id
          FROM pastes
          WHERE pastes.user_id = ? --paste user
            AND (
              pastes.visibility = 0
              OR pastes.user_id = ? --current user
            )
        )
    ) tbl
  END_OF_SQL
end
