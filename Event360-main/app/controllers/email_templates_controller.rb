class EmailTemplatesController < ApplicationController
    before_action :set_email_app
    
    def index
        @email_templates = EmailTemplate.where(application_id: @nxtapp.id)
    end

    def new
        @email_templates = EmailTemplate.new
    end
    
    def create
        email_templates_params_new = email_template_params.dup
        email_templates_params_new[:application_id] = @nxtapp.id
        @email_templates = EmailTemplate.new(email_templates_params_new)
        if @email_templates.save
            redirect_to email_templates_path
        else
            render :new
        end
    end

    def show
        redirect_to email_templates_path
      end

    def fill_in
        @email_templates = EmailTemplate.find_by(title: params[:title])
        @post = Post.new({title: @email_templates.title, content: @email_templates.content})
        @post.recipient = session[:post_recipient] if session[:post_recipient].present?
        redirect_to new_post_path(post: @post.attributes)
    end
    
    private
    def email_template_params
        params.require(:email_template).permit(:title, :content)
    end

    def set_email_app
        app = params[:app]
        @nxtapp = NxtApps.find_by(name: app)
    end
end