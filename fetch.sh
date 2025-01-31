latest=$(cat latest.txt)
latest_ts=$(date -j -f "%Y-%m-%dT%H:%M:%SZ" "$latest" +%s)

res=$(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_PAT" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/ubbeg2000/gh-ci/commits?page=1&per_page=1") 
  
date=$(echo $res | tr { '\n' | tr , '\n' | tr } '\n' | grep "date" | awk  -F'"' '{print $4}')
date=$(echo $date | cut -d ' ' -f 1)
commit_ts=$(date -j -f "%Y-%m-%dT%H:%M:%SZ" "$date" +%s)

if [ $latest_ts -lt $commit_ts ]; then
    echo "ada yang baru nich"
else
    echo "pler"
fi