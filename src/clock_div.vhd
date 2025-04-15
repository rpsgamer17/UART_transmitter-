library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_div is
    port (
        clk : in std_logic;
        div : out std_logic
    );
end clock_div;

architecture behavior of clock_div is
    signal counter : std_logic_vector (2 downto 0) := (others => '0');  -- 3-bit counter for 0 to 4
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if unsigned(counter) = 4 then
                counter <= (others => '0');
                div <= '1';
            else
                counter <= std_logic_vector(unsigned(counter) + 1);
                div <= '0';
            end if;
        end if;
    end process;
end behavior;