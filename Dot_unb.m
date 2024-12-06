function [ alpha_out ] = Dot_unb( alpha, x, y )

  [ xT, ...
    xB ] = FLA_Part_2x1( x, ...
                         0, 'FLA_TOP' );

  [ yT, ...
    yB ] = FLA_Part_2x1( y, ...
                         0, 'FLA_TOP' );
  alpha = 0;
  while ( size( xT, 1 ) < size( x, 1 ) )

    [ x0, ...
      chi1, ...
      x2 ] = FLA_Repart_2x1_to_3x1( xT, ...
                                    xB, ...
                                    1, 'FLA_BOTTOM' );

    [ y0, ...
      psi1, ...
      y2 ] = FLA_Repart_2x1_to_3x1( yT, ...
                                    yB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%
    alpha = chi1 * psi1 + alpha;
    %                       update line 1                        %
    %                             :                              %
    %                       update line n                        %

    %------------------------------------------------------------%

    [ xT, ...
      xB ] = FLA_Cont_with_3x1_to_2x1( x0, ...
                                       chi1, ...
                                       x2, ...
                                       'FLA_TOP' );

    [ yT, ...
      yB ] = FLA_Cont_with_3x1_to_2x1( y0, ...
                                       psi1, ...
                                       y2, ...
                                       'FLA_TOP' );

  end

  alpha_out = alpha;


return
%Không, (x_T) không có cấu trúc giống (x_B) với 3 thành phần. 
% (x_T) chỉ là **một phần vector**, và nó được mở rộng dần sau mỗi
% vòng lặp để chứa tất cả các phần tử đã xử lý. Trong khi đó, (x_B) (phần chưa xử lý) 
% tạm thời được chia thành **3 phần**: (x_0), (chi_1), và (x_2), nhưng 
% đây chỉ là cách tách logic trong mỗi vòng lặp để xử lý từng phần tử.

%---

%### Phân biệt giữa (x_T) và (x_B)
%1. **(x_T):**
%   - Là phần đã xử lý.
%   - Không bị chia nhỏ, nó được xây dựng dần dần qua mỗi vòng lặp.
%   - Sau mỗi bước, một phần tử từ (x_B) được thêm vào (x_T).
%
%2. **(x_B):**
%   - Là phần chưa xử lý.
%   - Tạm thời được chia thành 3 phần:
%     - (x_0): phần trên của (x_B), thuộc về (x_T) sau khi xử lý.
%     - (chi_1): phần tử hiện tại được xử lý.
%     - (x_2): phần còn lại của (x_B), chưa được xử lý.

%---

% Ví dụ minh họa
%Giả sử (x = [1; 2; 3]):

% Ban đầu:
%- (x_T = []),
%- (x_B = [1; 2; 3]).

% Bước 1:
%1. (x_B) được chia:
%   - (x_0 = []),
%   - (chi_1 = 1),
%   - (x_2 = [2; 3]).
%2. Xử lý (chi_1 = 1).
%3. Sau khi xử lý:
%   - (x_T = [1]),
%   - (x_B = [2; 3]).

%Bước 2:
%1. (x_B) được chia:
%   - (x_0 = []),
%   - (chi_1 = 2),
%   - (x_2 = [3]).
%2. Xử lý (chi_1 = 2).
%3. Sau khi xử lý:
%   - (x_T = [1; 2]),
%   - (x_B = [3]).

% Bước 3:
%1. (x_B) được chia:
%   - (x_0 = []),
%   - (chi_1 = 3),
%   - (x_2 = []).
%2. Xử lý (chi_1 = 3).
%3. Sau khi xử lý:
%   - (x_T = [1; 2; 3]),
%   - (x_B = []).

%---

%### Kết luận
%  - (x_T) và (x_B) có vai trò khác nhau:
%  - (x_T): không bao giờ được chia thành 3 phần, chỉ là tập hợp của các phần tử đã xử lý.
%  - (x_B): được tách thành (x_0), (chi_1), và (x_2) trong từng vòng lặp,
% nhưng đó chỉ là cách tạm thời để xử lý phần tử.
%  - Sau khi hoàn tất, (x_T) sẽ chứa toàn bộ các phần tử của (x), còn (x_B) trở thành rỗng.