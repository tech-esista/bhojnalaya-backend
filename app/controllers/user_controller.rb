class UserController < ApplicationController

    def add_or_update_user
        return unless has_sufficient_params(%w[email])

        if params[:id].present?
            user = User.where(id: params[:id]).first
            if params[:email].present?
                existing_user = User.where('email ilike ? and id != ?', params[:email].strip,params[:id]).first
                if existing_user
                    render_error_message "This email is already registered with us."
                    return
                end
            end
            unless user
                render_error_message 'User not present.'
                return
            end
        else
            if params[:email].present?
                user = User.where('email ilike ?', params[:email].strip).first
                if user
                    render_error_message "This email is already registered with us."
                    return
                end
            end

            user = User.new
        end
        user.name = params[:name].strip.titleize if params[:name].present?
        user.email = params[:email].strip.downcase if params[:email].present?
        user.status_id = params[:status_id] if params[:status_id].present?
        if params[:is_admin].present?
            user.is_admin = params[:is_admin]
        end

        if params[:password].present?
            user.password = params[:password]
        end

        if user.save
            render_success_message 'User saved successfully.'
        else
            render_error_message user.errors.full_messages.first
        end
    end

    def get_user_profile
        return unless has_sufficient_params(%w[id])

        if params[:id].present?
            user = User.where(id: params[:id]).first
            render_result_json user
        else
            render_error_message 'User not present.'
        end
    end


    def request_account_access
        return unless has_sufficient_params(%w[email password])

        user = User.where('email ilike ?', params[:email]).first

        unless user
            render_error_message 'Invalid Access. Please check your Email and Password.'
            return
        end

        unless user.valid_password?(params[:password])
            render_error_message 'Invalid Access. Please check your Email and Password.'
            return
        end

        unless user.status_id == 1
            render_error_message 'Your Account is not Active yet.'
            return
        end

        render_result_json user
    end

    def get_all_users
        users = User.all
        render_result_json users
    end

end
