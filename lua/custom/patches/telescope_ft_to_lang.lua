local ok, ts_utils = pcall(require, "telescope.previewers.utils")
if ok and ts_utils then
  ts_utils.ft_to_lang = function(ft)
    return ft or ""
  end
end
