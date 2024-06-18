# เครดิต UKB - DEVELOPER (Unknowkubbrother)

# คำสั่ง
```lua
  ** คำสั่งแอดมินสำหรับเสกรถให้ผู้เล่นแบบระบุป้ายทะเบียน **
    => playerId คือ ID ของผู้เล่น
    => model คือ โมเดลรถ
    => Plate คือ ป้ายทะเบียนรถ มีเว้นวรรคด้วย
    => typecar คือ ประเภทรถ
    => คำสั่ง /ukb_gcar_plate <playerId> <model> <Plate> <typecar>
    => ตัวอย่าง /ukb_gcar_plate 1 neon LNW 111 car

 ** คำสั่งแอดมินสำหรับเสกรถให้ผู้เล่นแบบสุ่มป้ายทะเบียน **
    => playerId คือ ID ของผู้เล่น
    => model คือ โมเดลรถ
    => typecar คือ ประเภทรถ
    => คำสั่ง /ukb_gcar <playerId> <model> <typecar>
    => ตัวอย่าง /ukb_gcar 1 neon car

 ** คำสั่งแอดมินสำหรับลบรถ **
    => playerId คือ ID ของผู้เล่น
    => Plate คือ ป้ายทะเบียนรถ มีเว้นวรรคด้วย
    => คำสั่ง /ukb_delcar <playerId> <Plate>
    => ตัวอย่าง /ukb_delcar 1 LNW 111
```