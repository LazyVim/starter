return {
  {
    "jbyuki/instant.nvim",
    cmd = {
      "InstantStartServer",
      "InstantStopServer",
    },
  },
  {
    "mistricky/codesnap.nvim",
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
