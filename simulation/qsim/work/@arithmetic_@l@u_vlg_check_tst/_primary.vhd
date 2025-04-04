library verilog;
use verilog.vl_types.all;
entity Arithmetic_LU_vlg_check_tst is
    port(
        Equal           : in     vl_logic_vector(7 downto 0);
        SubNeg          : in     vl_logic_vector(7 downto 0);
        SubPos          : in     vl_logic_vector(7 downto 0);
        oAccu           : in     vl_logic_vector(7 downto 0);
        oCarryFlag      : in     vl_logic;
        oDiff           : in     vl_logic_vector(7 downto 0);
        oQ_leftA        : in     vl_logic_vector(7 downto 0);
        oQ_leftB        : in     vl_logic_vector(7 downto 0);
        oQ_rightA       : in     vl_logic_vector(7 downto 0);
        oQ_rightB       : in     vl_logic_vector(7 downto 0);
        oZeroFlag       : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Arithmetic_LU_vlg_check_tst;
