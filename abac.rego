package app.abac

default allow = false

allow {
	user_is_owner
}

allow {
	user_is_employee
	action_is_read
}

allow {
	user_is_employee
	user_is_senior
	action_is_update
}

allow {
	user_is_customer
	action_is_read
	not pet_is_adopted
}

user_is_owner {
	data.user_attributes[input.user].title == "owner"
}

user_is_employee {
	data.user_attributes[input.user].title == "employee"
}

user_is_customer {
	data.user_attributes[input.user].title == "customer"
}

user_is_senior {
	data.user_attributes[input.user].tenure > 8
}

action_is_read {
	input.action == "read"
}

action_is_update {
	input.action == "update"
}

pet_is_adopted {
	data.pet_attributes[input.resource].adopted == true
}
