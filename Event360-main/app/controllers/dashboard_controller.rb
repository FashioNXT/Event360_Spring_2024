class DashboardController < ApplicationController
    def index
        @nxt_apps_count = NxtApps.count
        @email_templates_count = EmailTemplate.count
        @user_count = User.count
        @post_count = Post.count
    end
end
