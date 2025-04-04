library verilog;
use verilog.vl_types.all;
entity Arithmetic_LU_vlg_sample_tst is
    port(
        iA              : in     vl_logic_vector(7 downto 0);
        iB              : in     vl_logic_vector(7 downto 0);
        iClk            : in     vl_logic;
        iLinshiftleft   : in     vl_logic;
        iLinshiftright  : in     vl_logic;
        iOpCode         : in     vl_logic_vector(3 downto 0);
        iReset          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arithmetic_LU_vlg_sample_tst;
