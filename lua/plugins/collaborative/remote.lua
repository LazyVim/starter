return {
  {
    "jbyuki/instant.nvim",
    cmd = {
      "InstantStartServer",
      "InstantStopServer",
    },
  },
  {
    "miversen33/netman.nvim",
    cmd = {
      "Neotree remote",
    },
  },
  {
    "rmagatti/auto-session",
    event = "VimEnter",
    opts = {
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = true,
      auto_session_use_git_branch = true,
      pre_save_cmds = { "BDelete! nameless", "BDelete! hidden", "BDelete glob=yode*", "cclose" },
    },
  },
}
