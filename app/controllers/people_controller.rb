class PeopleController < ApplicationController
  before_action :authenticate_user!
  before_action :set_person, only: [:show, :edit, :update, :destroy, :help]

  def index
    @people = Person.all
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
    @person.update_attribute(:coordinator_id, current_user.id)
    redirect_to people_path, notice: t('person_updated')
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
        :skype,
        :fb,
        :city,
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
        :status
      )
    end
end
