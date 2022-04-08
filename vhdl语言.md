上升沿描述 多种方法
rising_edge(clk)
clk'event and ckl='1'
信号和变量：
变量立即更新
信号在process执行完毕后才更新
操作：
信号：
<=
变量：
:=
赋值：
比如说cnt是std_logic_vector(7 downto 0）；
那么cnt<=(1=>'1',others=>'0')；就表示给cnt的第1位赋1，其他位的全部都赋0，结果cnt=“00000010”；
signal  com3:std_logic_vector(7 downto 0):=X"38";实现赋初值
注意signal之前没有begin
wait on 只能存在一个