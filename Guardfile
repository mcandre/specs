guard :shell do
  watch(/^Rakefile|\.*|.*\.rb$/) do ||
    title = 'Lint'
    eager 'rake lint'
    status = ($CHILD_STATUS.success? && :success) || :failed
    n '', title, status
    ''
  end
end
