% Write a Prolog Program for Path implementation.
%Fact:
link(0,1). 
link(0,3). 
link(1,2). 
link(1,4). 
link(2,5). 
link(4,5). 
link(3,4).

%Rules:
path(StartNode, StartNode).
path(StartNode,EndNode):-   link(StartNode, NextNode),  path(NextNode,EndNode). 