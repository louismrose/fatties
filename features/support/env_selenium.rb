Capybara.default_driver    = :selenium
Capybara.javascript_driver = :selenium


# Transactional fixtures cannot be used as Selenium runs in separate process to Cucumber
# So a database cleaner is used instead
DatabaseCleaner.clean_with :truncation # clean once to ensure clean slate
DatabaseCleaner.strategy = :truncation

Before do
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end