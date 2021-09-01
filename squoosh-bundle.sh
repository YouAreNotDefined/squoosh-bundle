echo "出力先ディレクトリを入力（デフォルト ./out/）:"
read OUT
echo "圧縮率を入力（デフォルト 30）:"
read QUALITY

OUTVAL="out"
if [ -n "$OUT" ]; then
  OUTVAL="$OUT"
fi

QUALITYVAL="30"
if [ -n "$QUALITY" ]; then
  QUALITYVAL="$QUALITY"
fi

for FILE in ./*
    do
    FILENAME=`echo ${FILE}`
    if [ `echo ${FILENAME} | grep '.jpg'` ]; then
      squoosh-cli --mozjpeg "{quality:${QUALITYVAL}}" -d ${OUTVAL} ${FILENAME}
    elif [ `echo ${FILENAME} | grep '.png'` ]; then
      squoosh-cli --oxipng "{quality:${QUALITYVAL}}" -d ${OUTVAL} ${FILENAME}
    elif [ `echo ${FILENAME} | grep '.webp'` ]; then
      squoosh-cli --webp "{quality:${QUALITYVAL}}" -d ${OUTVAL} ${FILENAME}
    else
      continue
    fi
    done
