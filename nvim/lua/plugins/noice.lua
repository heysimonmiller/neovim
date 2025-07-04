return {
  {
    "folke/noice.nvim",
    -- No need to repeat event or dependencies if the extra already sets them,
    -- unless you want to override them. Just providing `opts` is usually enough.
    opts = {
      routes = {
        {
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = {
            skip = true,
          },
        },
        -- To ensure you don't overwrite other default routes from the extra,
        -- you might need to be more careful if the extra defines routes.
        -- A safer way for merging tables like `routes` is often to use a function for `opts`:
      },
    },
  },
}
