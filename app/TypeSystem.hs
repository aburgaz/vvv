module TypeSystem where

type Id = String

data Ty
  = IntTy
  | BoolTy
  | CharTy
  | VoidTy
  | FunTy
      { funTyArgs :: [Ty],
        funTyRetTy :: Ty
      }
  | ArrTy
      { arrTyElemTy :: Ty,
        arrTySize :: Int
      }
  deriving (Show, Eq)

sizeOf :: Ty -> Int
sizeOf IntTy = 8
sizeOf BoolTy = 8
sizeOf CharTy = 1
sizeOf VoidTy = 0
sizeOf (FunTy {funTyArgs}) = sum (map sizeOf funTyArgs)
sizeOf (ArrTy {arrTyElemTy, arrTySize}) = sizeOf arrTyElemTy * arrTySize

data BinOp
  = -- Arithmetic
    Add
  | Sub
  | Mul
  | Div
  | Mod
  | -- Logical
    And
  | Or
  | Xor
  | -- Comparison
    Equal
  | LessThan
  | GreaterThan
  | LessThanOrEqual
  | GreaterThanOrEqual
  | NotEqual
  deriving (Eq)

instance Show BinOp where
  show Add = "+"
  show Sub = "-"
  show Mul = "*"
  show Div = "/"
  show Equal = "=="
  show LessThan = "<"
  show GreaterThan = ">"
  show LessThanOrEqual = "<="
  show GreaterThanOrEqual = ">="
  show NotEqual = "!="
  show And = "&&"
  show Or = "||"
  show Xor = "^"
  show Mod = "%"

data UnaryOp
  = UnarySub
  | UnaryNot
  deriving (Eq)

instance Show UnaryOp where
  show UnarySub = "-"
  show UnaryNot = "!"