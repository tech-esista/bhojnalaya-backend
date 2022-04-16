\class DailyAccountsController < ApplicationController

	def get_daily_accounts
        render_result_json DailyAccount.all
    end

    def update_daily_account
        return unless has_sufficient_params(%w[id capacity])

        daily_account = DailyAccount.where(id: params[:id]).first

        unless daily_account.present?
            render_error_message 'Account info not found!'
            return
        end

        daily_account.update(capacity: params[:capacity])

        render_result_message 'Updated successfully!'
    end

end
