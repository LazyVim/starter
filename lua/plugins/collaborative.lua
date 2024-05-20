return {
  {
    "jbyuki/instant.nvim",
    lazy = true,
    cmd = {
      "InstantStartServer",
      "InstantStopServer",
    },
  },
  {
    "mistricky/codesnap.nvim",
    lazy = true,
    build = "make",
    cmd = {
      "CodeSnap",
      "CodeSnapSave",
    },
    opts = {
      save_path = "~/Pictures/ScreenShot/",
    },
  },
}
