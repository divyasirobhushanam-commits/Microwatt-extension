library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.common.all;
use work.decode_types.all;

entity custom_scalar_unit is
    port (
        ra     : in  std_ulogic_vector(63 downto 0);
        rb     : in  std_ulogic_vector(63 downto 0);
        rc     : in  std_ulogic_vector(63 downto 0);
        insn   : in  std_ulogic_vector(31 downto 0);
        result : out std_ulogic_vector(63 downto 0)
    );
end entity custom_scalar_unit;

architecture rtl of custom_scalar_unit is

    -- Fixed-point helper functions (integer only, synthesizable)
    function fp8_to_int(a : std_ulogic_vector(7 downto 0)) return integer is
    begin
        return to_integer(unsigned(a));
    end function;

    function int_to_fp8(i : integer) return std_ulogic_vector is
        variable val : integer := i;
    begin
        if val < 0 then
            val := 0;
        elsif val > 255 then
            val := 255;
        end if;
        return std_logic_vector(to_unsigned(val, 8));
    end function;

begin
    process(all)
        variable res8 : std_ulogic_vector(7 downto 0);
        variable ai, bi, ri : integer;
    begin
        res8 := (others => '0');

        case insn(5 downto 2) is
            when "0000" =>  -- OP_CUSTOM_ADD_I8
                res8 := std_logic_vector(unsigned(ra(7 downto 0)) + unsigned(rb(7 downto 0)));

            when "0001" =>  -- OP_CUSTOM_SUB_I8
                res8 := std_logic_vector(unsigned(ra(7 downto 0)) - unsigned(rb(7 downto 0)));

            when "0010" =>  -- OP_CUSTOM_FP8_ADD (integer emulation)
                ai := fp8_to_int(ra(7 downto 0));
                bi := fp8_to_int(rb(7 downto 0));
                ri := ai + bi;
                res8 := int_to_fp8(ri);

            when "0011" =>  -- OP_CUSTOM_FP8_MUL (integer emulation)
                ai := fp8_to_int(ra(7 downto 0));
                bi := fp8_to_int(rb(7 downto 0));
                ri := (ai * bi) / 16;  -- scaled multiply
                res8 := int_to_fp8(ri);

            when others =>
                res8 := (others => '0');
        end case;

        result <= (63 downto 8 => '0') & res8;
    end process;

end architecture rtl;




