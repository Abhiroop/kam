module KAM where

newtype Label = L { i :: Int } deriving (Show, Ord, Eq)

type Offset = Int

data Instr = NOP
           | Immed Int | Nil
           | Cons      | Decons
           | Select Offset

           | Push | Pop | PopN Int | PushLbl Label
           | SelectStack Offset | StackAddr Offset

           | Label Label | Jmp Label
           | IfEq Int Label | IfCons Label

           | ApplyFunCall Label Int | ApplyFunJmp Label Int Int
           | ApplyFnCall Int | ApplyFnJmp Int Int
           | Return Int Int

           | SelectEnv Offset | EnvToAcc

           | LetRegionFin Int
           | LetRegionInf | EndRegionInf
           | StackAddrInfBit Offset
           | ClearAtbotBit | SetAtbotBit

           | Alloc Int | AllocIfInf Int | AllocSatInf Int
           | AllocSatIfInf Int | AllocAtbot Int

           | BlockAlloc Int | BlockAllocIfInf Int
           | BlockAllocSatInf Int | Block Int
           | BlockAllocSatIfInf Int | BlockAllocAtbot Int
           deriving (Ord, Show, Eq)

data Block = B Instr Block
           | Empty
           deriving (Ord, Show, Eq)

data Program = Fun Label Block Program
             | Fn  Label Block Program
             | EmptyP
             deriving (Ord, Show, Eq)
