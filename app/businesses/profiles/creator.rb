module Profiles
  class Creator < BusinessApplication
    def initialize(user)
      @user = user
    end

    def call
      create_profile
      add_skills
      profile_created?
    end

    private

    def create_profile
      @profile = @user.build_profile
      @profile.save(validate: false)
    end

    def add_skills
      @profile.skills << Skill.all
    end

    def profile_created?
      @profile.persisted?
    end
  end
end
