# name: Discourse Challonge Onebox
# about: Adds support for embedding Challonge tournament brackets within Discourse.
# version: 0.1
# authors: Daniel Marquard
# url: https://github.com/critcola/discourse-challonge-onebox

class Onebox::Engine::ChallongeOnebox
	include Onebox::Engine

	REGEX = /^https?:\/\/((?:\w+\.)?challonge.com)\/(\w+)/
	matches_regexp REGEX

	def hostname
		@url.match(REGEX)[1]
	end
	def id
		@url.match(REGEX)[2]
	end
	
	def to_html
		"<div width=\"695\" height=\"380\" style=\"overflow: hidden !important\"><iframe src=\"//#{hostname}/#{id}/module\" width=\"100%\" height=\"460\" frameborder=\"0\" scrolling=\"auto\" allowtransparency=\"true\"></iframe></div>"
	end
end
