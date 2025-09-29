      - name: Generate LIST with output list
        run: |
          echo "## Converted Configs" > Output.list
          echo "" >> Output.list
          USER=$(echo "${{ github.repository }}" | cut -d'/' -f1)
          REPO=$(echo "${{ github.repository }}" | cut -d'/' -f2)

          find output_configs -type f -name "*.yaml" | sort | while read file; do
            REL_PATH=$(echo "$file" | sed 's|^output_configs/||')
            FILE_NAME=$(basename "$file")
            echo "${FILE_NAME}|https://raw.githubusercontent.com/${USER}/${REPO}/refs/heads/main/output_configs/${REL_PATH}" >> Output.list
          done

      - name: Generate README.md
        run: |
          echo "# لیست پراکسی های استخراج شده از کالکتور های گیتهاب" > README.md
          echo "### لیست پراکسی استخراج شده خام" >> README.md
          echo "**فایل‌های پیکربندی آماده استفاده:**برای proxy-providers" >> README.md

          USER=$(echo "${{ github.repository }}" | cut -d'/' -f1)
          REPO=$(echo "${{ github.repository }}" | cut -d'/' -f2)

          EMOJIS=("🌐" "🚀" "🔒" "⚡" "🛡️")
          IDX=0

          find output_configs -type f -name "*.yaml" | sort | while read file; do
            REL_PATH=$(echo "$file" | sed 's|^output_configs/||')
            FILE_NAME=$(basename "$file")
            EMOJI=${EMOJIS[$((IDX % ${#EMOJIS[@]}))]}
            echo "- [${EMOJI} ${FILE_NAME}](https://raw.githubusercontent.com/${USER}/${REPO}/refs/heads/main/output_configs/${REL_PATH})" >> README.md
            IDX=$((IDX + 1))
          done

          cat << 'EOF' >> README.md

      - name: Configure Git user # پیکربندی اطلاعات Git برای commit کردن تغییرات
        run: |
          git config --global user.name "github-actions[bot]"
          git config --global user.email "github-actions[bot]@users.noreply.github.com"

      - name: Commit and push changes # commit کردن فایل‌های تبدیل شده و push آن‌ها به مخزن
        run: |
          # بررسی اینکه آیا پوشه خروجی وجود دارد و خالی نیست
          if [ -d "output_configs" ] && [ "$(ls -A output_configs)" ]; then
            git add output_configs Output.list README.md # اضافه کردن کل پوشه خروجی برای commit
            git commit -m "Update converted configs from daily subconverter action" || echo "No changes to commit" # اگر تغییری نبود، خطا نمی‌دهد.
            git push
          else
            echo "پوشه 'output_configs' خالی است یا وجود ندارد. هیچ تغییری برای commit وجود ندارد."
          fi
