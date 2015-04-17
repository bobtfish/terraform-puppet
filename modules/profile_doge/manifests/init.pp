class profile_doge {
  include doge
  Package <| title == 'python-doge' |> {
    name => 'doge'
    provider => 'pip'
  }
}
