local type Node = record
  name: string
  layer: number
  value: number
  left: Node
  right: Node
end

function Node:new(name: string, layer: number, value: number, left: Node, right: Node): Node
  local self: Node = setmetatable({}, { __index = Node })

  self.name = name
  self.layer = layer
  self.value = value
  self.left = left
  self.right = right

  return self
end

function Node:printNode()

  print("\n-- name = " .. tostring(self.name) .. " --" ..
        "\n- self layer = " .. tostring(self.layer) ..
        "\n- self value = " .. tostring(self.value))

  if self.left ~= nil then
    print("-- left branch:" ..
          "\n--- name = " .. tostring(self.left.name) ..
          "\n--- value = " .. tostring(self.left.value))
  else
    print("-- no left branch")
  end

  if self.right ~= nil then
    print("-- right branch:" ..
          "\n--- name = " .. tostring(self.right.name) ..
          "\n--- value = " .. tostring(self.right.value))
  else
    print("-- no right branch")
  end

  print("-- end of " .. tostring(self.name) .." --")
end

local tree1 = Node:new(
  tostring("tree1"),
  0,
  50,
  Node:new(
    tostring("node1"),
    25,
    312,
    Node:new(
      tostring("node1.1"),
      2,
      123498,
      nil,
      nil
    ),
    nil
  ),
  Node:new(
    tostring("node2"),
    1,
    75,
    nil, 
    nil
  )
)

tree1:printNode()
tree1.left:printNode()
tree1.right:printNode()
tree1.left.left:printNode()

local tree2 = Node:new(
  tostring("tree2"),
  0,
  50,
  Node:new(
    tostring("nodeleft"),
    1,
    25,
    Node:new(
      tostring("nodeleftleft"),
      2,
      12.5,
      Node:new(
        tostring("nodeleftleftleft"),
        3,
        345298,
        nil,
        nil
      ),
      nil
    ),
    nil
  ),
  nil
)

tree2:printNode()
tree2.left:printNode()
tree2.left.left:printNode()
tree2.left.left.left:printNode()