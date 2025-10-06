      - name: 📝 Generate ERROR⚠️ LIST
        run: |
          echo "## NOT Converted Configs" > Error.md
          echo "" >> Error.md
          echo "|File Line Count|File URL|" >> Error.md
          echo "|-|-|" >> Error.md

          USER=$(echo "${{ github.repository }}" | cut -d'/' -f1)
          REPO=$(echo "${{ github.repository }}" | cut -d'/' -f2)

          find output_configs -type f -name "*.yaml" | sort | while read file; do
            # شمارش خطوط فایل
            LINE_COUNT=$(wc -l < "$file")
            # echo "📋 شمارش خطوط فایل: $file → $LINE_COUNT"
            if [ "$LINE_COUNT" -lt 5 ]; then
              REL_PATH=$(echo "$file" | sed 's|^output_configs/||')
              echo "|[${LINE_COUNT}]|https://github.com/${USER}/${REPO}/blob/main/output_configs/${REL_PATH}|" >> Error.md
            fi
          done

      - name: 📝 Generate Output LIST
        run: |
          echo "## Exported Configs" > Output.list
          echo "" >> Output.list
          USER=$(echo "${{ github.repository }}" | cut -d'/' -f1)
          REPO=$(echo "${{ github.repository }}" | cut -d'/' -f2)

          find output_configs -type f -name "*.yaml" | sort | while read file; do
            # شمارش خطوط فایل
            LINE_COUNT=$(wc -l < "$file")
            if [ "$LINE_COUNT" -gt 10 ]; then
              REL_PATH=$(echo "$file" | sed 's|^output_configs/||')
              echo "[${LINE_COUNT}]${REL_PATH}|https://raw.githubusercontent.com/${USER}/${REPO}/refs/heads/main/output_configs/${REL_PATH}" >> Output.list
            fi
          done

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
