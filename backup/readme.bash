      - name: 📑 Generate README.md
        run: |
          echo "# لیست پراکسی های استخراج شده از کالکتور های گیتهاب" > README.md
          echo "### لیست پراکسی استخراج شده خام" >> README.md
          echo "**فایل‌های پیکربندی آماده استفاده:** مناسب برای proxy-providers" >> README.md
          echo "" >> README.md
          echo "|File URL|File Line Count|" >> README.md
          echo "|-|-|" >> README.md

          USER=$(echo "${{ github.repository }}" | cut -d'/' -f1)
          REPO=$(echo "${{ github.repository }}" | cut -d'/' -f2)

          EMOJIS=(
            "🌐" "🚀" "🔒" "⚡" "🛡️"   # your originals
            "📦" "🛰️" "📡" "🔧" "🗂️"
            "💻" "📊" "📝" "🌀" "🌍"
            "💡" "📁" "⚙️" "🖧" "🔗"
            "🧩" "🔍" "🖥️" "🔄" "📶"
            "✈️" "🌟" "🧭" "🏷️" "🔑"
          )
          IDX=0

          find output_configs -type f -name "*.yaml" | sort | while read file; do
            LINE_COUNT=$(wc -l < "$file")
            if [ "$LINE_COUNT" -gt 10 ]; then
              REL_PATH=$(echo "$file" | sed 's|^output_configs/||')
              EMOJI=${EMOJIS[$((IDX % ${#EMOJIS[@]}))]}
              echo "|[${EMOJI} ${REL_PATH}](https://raw.githubusercontent.com/${USER}/${REPO}/refs/heads/main/output_configs/${REL_PATH})|[${LINE_COUNT}]|" >> README.md
              IDX=$((IDX + 1))
            fi
          done

          cat << 'EOF' >> README.md
