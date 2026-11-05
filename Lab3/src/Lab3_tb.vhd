library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Lab3_tb is
end entity Lab3_tb;

architecture sim of Lab3_tb is

    signal clk  : STD_LOGIC := '0';
    signal sw0, sw1, sw2 : STD_LOGIC := '1';
    signal led0, led1, led2 : STD_LOGIC;

    constant CLK_PERIOD : time := 20 ns;

begin

    uut: entity work.Lab3
        port map (
            i_clk  => clk,
            i_sw0  => sw0,
            i_sw1  => sw1,
            i_sw2  => sw2,
            o_led0 => led0,
            o_led1 => led1,
            o_led2 => led2
        );

    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for CLK_PERIOD/2;
            clk <= '1';
            wait for CLK_PERIOD/2;
        end loop;
    end process;

    stim_process: process
    begin
        wait for 100 ns;

        -- Nhấn-nhả KEY0 -> LED0 toggle
        sw0 <= '0'; wait for 200 ns;
        sw0 <= '1'; wait for 200 ns;

        -- Nhấn-nhả KEY1 -> LED1 toggle
        sw1 <= '0'; wait for 200 ns;
        sw1 <= '1'; wait for 200 ns;

        -- Nhấn-nhả KEY2 -> LED2 toggle
        sw2 <= '0'; wait for 200 ns;
        sw2 <= '1'; wait for 200 ns;

        -- Nhấn lại KEY0 lần nữa -> LED0 toggle về trạng thái cũ
        sw0 <= '0'; wait for 200 ns;
        sw0 <= '1'; wait for 200 ns;

        wait;
    end process;

end architecture sim;