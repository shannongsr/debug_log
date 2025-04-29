% === Fluent GUI Reaction Journal Generator (Strict Full Steps) ===
clc;
clear;
close all;

% catalyst zone name 和 ID 的对应表
zones = {
    'catalyst_1_1', 195;
    'catalyst_1_2', 200;
    'catalyst_1_3', 199;
    'catalyst_1_4', 198;
    'catalyst_1_5', 197;
    'catalyst_1_6', 196;
    'catalyst_2_1', 189;
    'catalyst_2_2', 194;
    'catalyst_2_3', 193;
    'catalyst_2_4', 192;
    'catalyst_2_5', 191;
    'catalyst_2_6', 190;
    'catalyst_3_1', 183;
    'catalyst_3_2', 188;
    'catalyst_3_3', 187;
    'catalyst_3_4', 186;
    'catalyst_3_5', 185;
    'catalyst_3_6', 184
};

filename = 'set_reaction_gui_strict.jou';
fid = fopen(filename, 'w');

% 写入头
fprintf(fid, '/file/set-tui-version "24.1"\n\n');
fprintf(fid, '; === Auto-generated strict GUI script (full steps) ===\n\n');

for i = 1:size(zones, 1)
    name = zones{i, 1};
    id   = zones{i, 2};
    path = sprintf('Setup|Boundary Conditions|Wall|%s (wall, id=%d)', name, id);

    % === 按你要求的顺序输出 ===
    fprintf(fid, '(cx-gui-do cx-set-list-tree-selections "NavigationPane*Frame2*Table1*List_Tree2" (list "%s"))\n', path);
    fprintf(fid, '(cx-gui-do cx-set-list-tree-selections "NavigationPane*Frame2*Table1*List_Tree2" (list "%s"))\n', path);
    fprintf(fid, '(cx-gui-do cx-activate-item "NavigationPane*Frame2*Table1*List_Tree2")\n');
    fprintf(fid, '(cx-gui-do cx-set-list-tree-selections "NavigationPane*Frame2*Table1*List_Tree2" (list "%s"))\n', path);
    fprintf(fid, '(cx-gui-do cx-enable-apply-button "Wall")\n');
    fprintf(fid, '(cx-gui-do cx-set-toggle-button2 "Wall*Frame4*Frame4(Species)*Frame1*ButtonBox1*CheckButton1(Reaction)" #t)\n');
    fprintf(fid, '(cx-gui-do cx-activate-item "Wall*Frame4*Frame4(Species)*Frame1*ButtonBox1*CheckButton1(Reaction)")\n');
    fprintf(fid, '(cx-gui-do cx-set-list-selections "Wall*Frame4*Frame4(Species)*Frame1*Table2*DropDownList1(Reaction Mechanism)" ''( 1))\n');
    fprintf(fid, '(cx-gui-do cx-activate-item "Wall*Frame4*Frame4(Species)*Frame1*Table2*DropDownList1(Reaction Mechanism)")\n');
    fprintf(fid, '(cx-gui-do cx-activate-item "Wall*PanelButtons*PushButton1(OK)")\n');
    fprintf(fid, '(cx-gui-do cx-enable-apply-button "Wall")\n');
    fprintf(fid, '(cx-gui-do cx-activate-item "Wall*PanelButtons*PushButton2(Cancel)")\n\n');
end

% 最后统一停止录制
fprintf(fid, '(cx-gui-do cx-activate-item "MenuBar*WriteSubMenu*Stop Journal")\n\n');
fprintf(fid, '; === End of strict journal ===\n');

fclose(fid);

disp(['✅ Strict Journal generated: ', filename]);
