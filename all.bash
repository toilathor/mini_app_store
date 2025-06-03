#!/bin/bash

# Lệnh bạn muốn chạy trong mỗi submodule (có thể thay đổi)
CMD="${@}"

# Nếu không có lệnh truyền vào, hiển thị hướng dẫn
if [ -z "$CMD" ]; then
    echo "❌ Bạn cần truyền một lệnh để chạy trong từng submodule."
    echo "📌 Ví dụ: ./all.bash \"git status\""
    exit 1
fi

# Duyệt qua tất cả các submodule trong thư mục submodules/
for dir in ./*; do
    if [ -d "$dir/.git" ] || [ -f "$dir/.git" ]; then
        echo "▶️ Đang chạy trong $dir"
        (cd "$dir" && eval "$CMD")
        echo "✅ Xong $dir"
        echo
    else
        echo "⚠️ Bỏ qua $dir (không phải repo Git hợp lệ)"
    fi
done
