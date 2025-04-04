library verilog;
use verilog.vl_types.all;
entity Arithmetic_LU is
    port(
        iA              : in     vl_logic_vector(7 downto 0);
        iB              : in     vl_logic_vector(7 downto 0);
        iClk            : in     vl_logic;
        iReset          : in     vl_logic;
        iOpCode         : in     vl_logic_vector(3 downto 0);
        iLinshiftright  : in     vl_logic;
        iLinshiftleft   : in     vl_logic;
        oQ_leftA        : out    vl_logic_vector(7 downto 0);
        oQ_leftB        : out    vl_logic_vector(7 downto 0);
        oQ_rightA       : out    vl_logic_vector(7 downto 0);
        oQ_rightB       : out    vl_logic_vector(7 downto 0);
        oAccu           : out    vl_logic_vector(7 downto 0);
        SubPos          : out    vl_logic_vector(7 downto 0);
        SubNeg          : out    vl_logic_vector(7 downto 0);
        Equal           : out    vl_logic_vector(7 downto 0);
        oDiff           : out    vl_logic_vector(7 downto 0);
        oCarryFlag      : out    vl_logic;
        oZeroFlag       : out    vl_logic
    );
end Arithmetic_LU;
