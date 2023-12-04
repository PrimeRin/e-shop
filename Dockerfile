FROM ruby:2.7.8

# Set the working directory in the container
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN gem install bundler && bundle install

# Copy the application code to the container
COPY . .

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
