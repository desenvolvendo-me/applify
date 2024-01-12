module VersionsHelper
  def user_name(user_id)
    Profile.find_by(id: user_id)&.name || "Usuário Desconhecido"
  end
end
