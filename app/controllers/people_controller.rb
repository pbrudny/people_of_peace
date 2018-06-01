class PeopleController < ApplicationController
  before_action :authenticate_user!
  before_action :set_person, only: [:show, :edit, :update, :destroy, :help]

  def index
    @added_by_you = current_user.people
    @disciples = current_user.disciples
    @people_free = Person.free
  end

  def show
  end

  def new
    @person = Person.new
  end

  def edit
  end

  def create
    @person = Person.new(person_params)

    if ::People::AddPerson.new(@person).call
      redirect_to people_path, notice: t('person_created')
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to people_path, notice: t('person_updated') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: t('person_destroyed') }
    end
  end

  def help
    if @person.coordinator_id.nil?
      ::People::HelpPerson.new(@person, current_user).call
      redirect_to people_path, notice: t('person_help')
    else
      redirect_to people_path, alert: t('person_not_needed', user_name: @person.coordinator.name)
    end
  end

  private
    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(
        :name,
        :email,
        :phone,
        :age,
        :skype,
        :fb,
        :contact,
        :city,
        :source,
        :note,
        :user_id,
        :fellowship,
        :need_gospel,
        :need_baptism,
        :need_healing,
        :need_deliverance,
        :need_holy_spirit,
        :need_bible_study,
        :remote_possible,
        :background,
        :status,
        :coordinator_id,
        :display
      )
    end
end
