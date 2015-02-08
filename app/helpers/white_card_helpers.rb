def users_white_cards
  Card.where(color: "white", created_by: current_user.id)
end
