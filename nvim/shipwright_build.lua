local lushwright = require("shipwright.transform.lush")
run(
    require("lua/lush_theme/lillilac"),
    lushwright.to_lua,
    { patchwrite, "colors/lillilac.lua", "-- PATCH_OPEN", "-- PATCH_CLOSE" }
)
