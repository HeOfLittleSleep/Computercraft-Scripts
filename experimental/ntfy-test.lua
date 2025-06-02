--Import the API to be used in your code
--Make sure to use the full path for THIS ComputerCraft PC

--Set your NTFY Custom Channel URL:
NTFY_channel = "https://ntfy.sh/HOLS_MC-Alerts"

--Bacic Usage:
--NTFY_P73.Notice(NTFY_channel, "Your Message to Send")

--Custom Usage:
ntfytitle = "Reactor starting up"
nftytext = "Hello NTFY!"
ntfytags = "radioactive,radioactive,radioactive" --check here for your options: https://docs.ntfy.sh/publish/#tags-emojis

--Headers Tested:
		-- ["At"] = "2m"} ## 2min Delay: https://docs.ntfy.sh/publish/#scheduled-delivery

		-- ["Markdown"] = "yes" https://docs.ntfy.sh/publish/#markdown-formatting

		-- ["Actions"] = Actions :https://docs.ntfy.sh/publish/#action-buttons
			-- Actions = "view, MC_Server WebUI, https://XXX.XXX.X.XXX/, clear=true;"

	--The Headers Table format here (used below) is important,
	--Keep that in mind for anything imported from the docs:

--Set the Headers Table:
--ntfyheaders = ntfytags , ntfytitle
ntfyheaders = { ["Tags"] = ntfytags ,["Title"] = ntfytitle}

--Send the Custom NTFY Message/Notice
--NTFY_P73.Notice(NTFY_channel, nftytext, ntfyheaders)
http.post(NTFY_channel, nftytext, ntfyheaders)