require 'movie_data_model'
require 'set'

module GoingLoopless
  # Returns all the people who have taken on the role with the given name.
  #
  def find_all_in_role(role_name, people)
  #   results = []
  #   people.each do |person|
  #     person.roles.each do |role|
  #       if role.name == role_name
  #         results << person
  #         break
  #       end
  #     end
  #   end
  #   results
  # end
    people.select { |person| person.roles.map(&:name).include?(role_name) }
  end

  # List the titles and years of all the movies in which the given person played a role, in
  # chronological order.
  #
  def list_movies(person)
    # movies = []
    # person.roles.each do |role|
    #   unless movies.include?(role.movie)
    #     movies << role.movie
    #   end
    # end
    # movies.sort_by!(&:year)  #  (&:year) is shorthand for { |o| o.year }

    # results = []
    # movies.each do |movie|
    #   results << "#{movie.title} (#{movie.year})"
    # end
    # results
    person.roles.map(&:movie).uniq.sort_by(&:year).map{ |movie| "#{movie.title} (#{movie.year})" }
  end

  # Creates a list of credits entry of the form "Person Name (role)", with the roles appearing in
  # the order specified in role_order, and each person appearing multiple times if they took on
  # multiple roles in the film.
  #
  def build_credits(movie, role_order)
  #   results = []
  #   role_order.each do |role_name|
  #     movie.roles.each do |role|
  #       if role.name == role_name
  #         results << "#{role.person.name} (#{role.name})"
  #       end
  #     end
  #   end
  #   results
    movie.roles.sort_by{ |role| role_order.find_index(role.name)}.map{ |role| "#{role.person.name} (#{role.name})" }
  end
end
