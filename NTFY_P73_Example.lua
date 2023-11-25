--Import the API to be used in your code
--Make sure to use the full path for THIS ComputerCraft PC
os.loadAPI("/rom/apis/NTFY_P73.lua")

--Set your NTFY Custom Channel URL:
NTFY_channel = "https://ntfy.sh/HOLS_MC-Alerts"

--Bacic Usage:
NTFY_P73.Notice(NTFY_channel, "CraftOS-PC test push")

--Custom Usage:
---ntfytitle = "Custom Title for this Notice"
---nftytext = "Your custom message to send"
---ntfytags = "rotating_light,computer,warning" --check here for your options: https://docs.ntfy.sh/publish/#tags-emojis

--Headers Tested:
		-- ["At"] = "2m"} ## 2min Delay: https://docs.ntfy.sh/publish/#scheduled-delivery

		-- ["Markdown"] = "yes" https://docs.ntfy.sh/publish/#markdown-formatting

		-- ["Actions"] = Actions :https://docs.ntfy.sh/publish/#action-buttons
			-- Actions = "view, MC_Server WebUI, https://XXX.XXX.X.XXX/, clear=true;"

	--The Headers Table format here (used below) is important,
	--Keep that in mind for anything imported from the docs:

--Set the Headers Table:
---ntfyheaders = {["Tags"] = ntfytags ,["Title"] = ntfytitle}

--Send the Custom NTFY Message/Notice
---NTFY_P73.Notice(NTFY_channel, nftytext, ntfyheaders)