library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Lab3 is
    port (
        i_clk  : in  STD_LOGIC;
        i_sw0  : in  STD_LOGIC;
        i_sw1  : in  STD_LOGIC;
        i_sw2  : in  STD_LOGIC;
        o_led0 : out STD_LOGIC;
        o_led1 : out STD_LOGIC;
        o_led2 : out STD_LOGIC
    );
end entity Lab3;

architecture rtl of Lab3 is

    signal sw0_sync0, sw0_sync1, sw0_sync2 : STD_LOGIC := '1';
    signal sw1_sync0, sw1_sync1, sw1_sync2 : STD_LOGIC := '1';
    signal sw2_sync0, sw2_sync1, sw2_sync2 : STD_LOGIC := '1';

    signal led0_reg, led1_reg, led2_reg : STD_LOGIC := '0';

begin

    process(i_clk)
    begin
        if rising_edge(i_clk) then

            ------------------------------------------------
            -- Kênh 0: KEY0 -> LED0
            ------------------------------------------------
            sw0_sync0 <= i_sw0;
            sw0_sync1 <= sw0_sync0;
            sw0_sync2 <= sw0_sync1;

            if (sw0_sync2 = '0' and sw0_sync1 = '1') then
                led0_reg <= not led0_reg;
            end if;

            ------------------------------------------------
            -- Kênh 1: KEY1 -> LED1
            ------------------------------------------------
            sw1_sync0 <= i_sw1;
            sw1_sync1 <= sw1_sync0;
            sw1_sync2 <= sw1_sync1;

            if (sw1_sync2 = '0' and sw1_sync1 = '1') then
                led1_reg <= not led1_reg;
            end if;

            ------------------------------------------------
            -- Kênh 2: KEY2 -> LED2
            ------------------------------------------------
            sw2_sync0 <= i_sw2;
            sw2_sync1 <= sw2_sync0;
            sw2_sync2 <= sw2_sync1;

            if (sw2_sync2 = '0' and sw2_sync1 = '1') then
                led2_reg <= not led2_reg;
            end if;

        end if;
    end process;

    o_led0 <= not led0_reg;
    o_led1 <= not led1_reg;
    o_led2 <= not led2_reg;

end architecture rtl;