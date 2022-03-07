class OrderPolicy < ApplicationPolicy
  def create?
    record.user.present?
  end

  def show?
    true
    # se o order pertence ao usuario e se o veiculo pertence ao order
  end
end
