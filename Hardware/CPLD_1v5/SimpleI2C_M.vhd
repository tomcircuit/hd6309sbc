entity simpleI2C_M is
  port (
    reset     : in  std_logic;      -- active low reset signal
    clk       : in  std_logic;      -- state machine clock (4x the I2C bus frequency)
    SCL_q     : out std_logic;      -- SCL drive output
    SDA_q     : out  std_logic;     -- SDA drive output
    SDA_in    : in std_logic;       -- SDA read input (SDA_q and SDA_in joined at toplevel)
    start     : in std_logic);      -- active high START input (execute command)
    busy      : out std_logic);     -- active high BUSY output (FSM is busy)
    command   : in std_logiv_vector(1 downto 0)    -- COMMAND input (00 = FSM IDLE, 01 = BYTE, 10 = GO_MASTER, 11 = STOP)
    ACK_Send  : in std_logic;                      -- ACK to be sent during BYTE
    ACK_Rcvd  : out std_logic;                     -- ACK received during BYTE
    Data_Send : in std_logic_vector(7 downto 0);   -- DATA to be sent during BYTE/MASTER
    Data_Rcvd : out std_logic_vector(7 downto 0);  -- DATA received during BYTE/MASTER
end simpleSPI_M;

architecture a of simpleI2C_M is
    type state_type is (IDLE, STOP, STOP1, BYTE, BYTE1, BYTE2, BYTE3, GOMASTER, GOMASTER1);
    signal state : state_type;
begin

  process(clk, reset, start)
	constant dataLen : integer := 8;
	variable index : integer range 0 to dataLen := 0;
	variable SDA_v : std_logic;
    variable BitsToSend, BitsReceived : std_logic_vector(8 downto 0);
  begin
  
    --concatenate DATA and ACK bits into 9 bit vectors for BitsToSend and BitsReceived
    BitsToSend(8 downto 0) := Data_Send(7 downto 0) & ACK_Send;
    Data_Rcvd(7 downto 0) & ACK_Rcvd <= BitsReceived(8 downto 0);
  
    if (reset = '0') then
      BitsReceived := (others => '1');  
      SDQ_v := '1';
      busy <= '1';
      state <= STOP;
      
    else
      if(clk'event and clk = '1') then
        case state is
          when IDLE =>
            if (start = '1' and command = "01" ) then
              busy <= '1';                -- indicate that command is received            
              state <= BYTE;              -- begin the SEND_BYTE sequence
            elsif (start = '1' and command = "10" ) then 
              busy <= '1';                -- indicate that command is received                        
              state <= GOMASTER;          -- begin the GO_MASTER sequence
            elsif (start = '1' and command = "11" ) then 
              busy <= '1';                -- indicate that command is received                        
              state <= STOP;              -- begin the STOP sequence
            else
              busy <= '0';                -- indicate the interface is available
              state <= IDLE;              -- remain in FSM IDLE until commanded otherwise
              index := dataLen;           -- always prepare for sending data
            end if;
            
          when STOP =>
            SCL_q <= '1';                 -- release SCL (leave SDA unchanged)
            state <= STOP1;               -- to STOP1 next clock
            
          when STOP1 =>
            SDA_v := '1';                 -- release SDA after SCL release
            state <= IDLE;                -- return to IDLE state
            
          when BYTE =>
            SCL_q <= '0';                 -- SCL is always LOW at beginning of each bit
            SDA_v := BitsToSend(index);   -- set up SDA output while SCL is low
            state <= BYTE1;               -- to BYTE1 next clock
            
          when BYTE1 =>
            SCL_q <= '1';                 -- bring SCL high to clock bit into slave
            state <= BTYE2;               -- to BYTE2 next clock
            
          when BYTE2 =>
             BitsReceived(index) <= SDA_in;  --sample SDA while SCL is high 
             state < = BYTE3;             -- to BYTE3 next clock
             
          when BYTE3 =>
            SCL_q <= '0';                 -- lower SCL at end of bit
            if (index = 0) then           -- check to see if all bits sent
              state <= IDLE;              -- if so, return to FSM IDLE state
            else
              index := index - 1;         -- decrement bit pointer
              state <= BYTE1;             -- send next bit
            end if;
            
          when GOMASTER =>
            SDA_v := '1';                 -- release both SCL and SDA
            SCL_q <= '1';
            state <= GOMASTER1            -- to GOMASTER1 next clock
            
          when GOMASTER1 =>
            SDA_v := '0';                 -- drive SDA low
            state <= GOMASTER2            -- to GOMASTER2 next clock
            
          when GOMASTER2 =>
            SCL_q <= '0';                 -- drive SCL low
            state <= BYTE;                -- to BYTE next clock
            
          when others => null;
          
        end case;
      end if; --(clk'event and clk = '1')
    end if; --(reset = '0')
    
    --drive SDA output from variable    
    SDA_q <= SDA_v;
    
  end process;
end a;



