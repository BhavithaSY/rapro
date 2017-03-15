<?PHP
 class access
    {
        //connection global variables
        var $host =null;
        var $user = null;
        var $pass = null;
        var $name = null;
        var $conn = null;
        var $result = null;
        
        //constructing class
        function __construct($dbhost,$dbuser,$dbpass,$dbname)
        {
            $this->host=$dbhost;
            $this->user=$dbuser;
            $this->pass=$dbpass;
            $this->name=$dbname;
        }
        //connection function
        public function connect()
        {
            //echo "Hello";
            $this->conn=new mysqli($this->host,$this->user,$this->pass,$this->name);
            if(mysqli_connect_errno())
            {
                //echo "could not connect to database";
            }else
            {
                //echo "Connected";
            }
            //support all languages
            $this->conn->set_charset("utf8");
            
        }
        //disconneting file
        public function disconnect()
        {
            //echo "entered disconnect";
            if($this->conn != null)
            {
                $this->con->close();
            }
        }
       // inserting user details
        public function registerUser($username,$password,$email)
        {
            //echo "enetred register user";
            //SQL COMMAND
           // $sql = "INSERT INTO users SET username = ?, password = ?, email = ?";
            $sql = "INSERT INTO users (username,password,email) VALUES (?, ?, ?)";
            //store query result in $statement
           $statement = $this->conn->prepare($sql);
           //if error
           if(!$statement)
           {
            throw new Exception($statement->error);
           }
           //bind 3 parameters of type string to be placed in sql command
           $statement->bind_param("sss", $username, $password, $email);
           // $statement->bindparam(1,$username);
           // $statement->bindparam(2,$password);
           // $statement->bindparam(3,$email);
           $returnValue = $statement->execute();
           //echo "return value is $returnValue :::::::";
           return $returnValue;
        }
        //select user information
        public function selectUser($username)
        {
            //echo("entered selsected user");
            $sql = "SELECT * FROM users WHERE username='". $username."'";
            //assign result we got from sql to $result var
            $result = $this->conn->query($sql);
            if ($result != null && (mysqli_num_rows($result) >= 1))
            {
               
                $row = $result->fetch_array(MYSQLI_ASSOC);
                if (!empty($row))
                {
                    
                    $returnArray = $row;
                }
            }
            
            return $returnArray;
        }
        //login check up
        public function loginUser($email,$password)
        {
            
            $sql = "SELECT * FROM users WHERE email='". $email."' AND password='". $password."'";
            //assign result we got from sql to $result var
            $result = $this->conn->query($sql);
            if ($result != null && (mysqli_num_rows($result) == 1))
            {
               
                $row = $result->fetch_array(MYSQLI_ASSOC);
                if (!empty($row))
                {
                    
                    $returnArray = $row;
                }
            }
            
            //echo json_encode($returnArray);
           // echo "The array is $returnArray";
            return $returnArray;
        }
    }
    ?>