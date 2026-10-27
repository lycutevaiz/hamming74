# B06 – Bộ mã hóa Hamming (7,4)

## 1. Mục tiêu
Thiết kế bộ mã hóa Hamming (7,4) bằng Verilog HDL, chuyển đổi 4 bit dữ liệu đầu vào thành mã 7 bit gồm 4 bit dữ liệu và 3 bit kiểm tra chẵn lẻ.

## 2. Giao diện
- Đầu vào: `ui_in[3:0]` – dữ liệu 4 bit.
- Đầu ra: `uo_out[6:0]` – mã Hamming 7 bit.

## 3. Công cụ sử dụng
- Icarus Verilog: mô phỏng chức năng.
- Yosys: tổng hợp logic.
- GitHub: quản lý mã nguồn.

## 4. Thiết kế RTL
Ba bit kiểm tra được tính bằng phép XOR:
- `p1 = d0 ^ d1 ^ d3`
- `p2 = d0 ^ d2 ^ d3`
- `p4 = d1 ^ d2 ^ d3`

Thứ tự đầu ra: `{d3, d2, d1, p4, d0, p2, p1}`.

## 5. Kiểm chứng
Testbench kiểm tra đủ 16 tổ hợp dữ liệu đầu vào 4 bit. Kết quả mô phỏng trên Icarus Verilog: `PASS: All 16 cases passed.`

## 6. Kết quả tổng hợp
Yosys báo cáo 6 cell XOR và không có flip-flop trong thiết kế tổ hợp này.

## 7. Cách chạy
Trong Ubuntu/WSL, tại thư mục chứa hai file Verilog:

```bash
iverilog -g2012 -o sim hamming74_encoder.v tb_hamming74.v
vvp sim
yosys -p "read_verilog hamming74_encoder.v; hierarchy -top hamming74_encoder; proc; opt; stat"
```

## 8. Giới hạn
Kết quả trên chứng minh chức năng mã hóa với 16 tổ hợp đầu vào và số cell logic theo lần tổng hợp đã chạy. Chưa khẳng định diện tích layout, timing, công suất hay khả năng chế tạo thực tế.

## 9. Tệp nguồn
- `hamming74_encoder.v`: thiết kế RTL.
- `tb_hamming74.v`: testbench kiểm tra chức năng.
