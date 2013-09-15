guard :shell do
  watch(/.+\.gemspec/) do |m|
    title = "Bundler output"
    msg = "Failure"
    status = :failed

    if system("bundle")
      msg = "Bundled"
      status = :success
    end

    n msg, title, status

    "-> #{msg}"
  end

  watch(/.+\.rb/) do |m|
    title = "Rake output"
    msg = "Failure"
    status = :failed

    if system("rake")
      msg = "Tested"
      status = :success
    end

    n msg, title, status

    "-> #{msg}"
  end
end
