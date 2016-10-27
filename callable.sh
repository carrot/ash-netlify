#!/bin/bash
# CREATE SITE

# POST /api/v1/sites will create a new site
# When creating a site, you can set the following properties:

# name, the name of the site (mysite.netlify.com)
# custom_domain, the custom domain of the site (www.example.com)
# password, password protect the site
# force_ssl, will force SSL on the site if SSL is enabled (requires a paid plan)
# processing_settings, lets you set the following processing settings: {“css”: {“bundle”: true, “minify”: true}, “js”: {“bundle”: true, “minify”: true}, “html”: {“pretty_urls”: true, “canonical_urls”: true}, “images”: {“optimize”: true}}
# repo, lets you configure continuous deployment. See the later section on that.


Netlify__callable_main() {
	# iterate thru all params
	while test $# -gt 0; do
					case "$1" in
									-n|--name)
													shift
													if test $# -gt 0; then
																	export PROCESS=$1
													else
																	echo "no process specified"
																	exit 1
													fi
													shift
													;;
									-p|--password*)
													export PROCESS=`echo $1 | sed -e 's/^[^=]*=//g'`
													shift
													;;
									*)
													break
													;;
					esac
	done	

	# make request
	body="{}"

	# send request
	API_URL="https://api.netlify.com/"
	API_PATH="/api/v1/sites"
	URL="$API_URL$API_PATH"
	curl -X POST -H "Content-Type: application/json" $URL
}

Netlify__callable_help(){
	more "$Ash__ACTIVE_MODULE_DIRECTORY/help.txt"
}
