<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- modal 코드 -->

<!-- 회원가입 모달 ******************************************************************-->
		<div class="modal" id="comModal">
			<div class="modal-pannel">
				<div id="action" class="modal-title">
				
				</div>
				<div class="modal-body">
					<form method="post" id="registerForm" name="registerForm">
					<div class="modal-body-line">
						<input id="member_id" name="member_id" type="text"
							placeholder="아이디를 입력하세요"> 
						<!-- <input type="button" id="idCheckBtn" value="중복확인"> -->	 
						<button class="modal-btn" id="idCheckBtn" type="button">중복확인</button>
					</div>
						<div id="idCheckDiv"></div>
					<div class="modal-body-line">
					<input id="member_pass"
						name="member_pass" type="password" placeholder="비밀번호를 입력하세요">
					<input id="member_pass2" name="member_pass2" type="password"
						placeholder="비밀번호 확인" style="float: right;"> <br>
					</div>
					<div class="modal-body-line">
					<input
						id="company_name" name="company_name" type="text"
						size="80" placeholder="기업명을 입력하세요"><br> 
					</div>
					<div class="modal-body-line" style="padding-top: 20px;">
					<label>기업 설립년도를 선택하세요</label>
					<input
						type="month" id="company_year" name="company_year" ><br>
					</div>
					<div class="modal-body-line">
					<input
						type="text" id="company_turnover" name="company_turnover" placeholder="매출액을 입력하세요"><br>	
					</div>
					<div class="modal-body-line"  style="padding-top: 20px;">
					<label for="company_size">기업 규모</label>	&nbsp;&nbsp;&nbsp;
					<select class="form-control" id="company_size" name="company_size">
						      <option value="==선택==">==선택==</option>
						      <option value="대기업(1000명 이상)">대기업 (1000명 이상)</option>
						      <option value="중견기업(500명 이상)">중견기업 (500명 이상)</option>
						      <option value="중소기업(50명 이상)">중소기업 (50명 이상)</option>
						      <option value="소기업">소기업 (50명 미만)</option>
				    </select>
				    </div>
				    <div class="modal-body-line"  style="padding-top: 20px;">
				    <label for="company_line">기업 산업군</label>	
					<select class="form-control" id="company_line" name="company_line">
								<option selected="selected" class="text-primary">==선택==</option>
								<optgroup label="사무직">
									<option value="frontend_developer">Front-End Developer</option>
									<option value="php_developor">PHP Developer</option>
									<option value="python_developer">Python Developer</option>
									<option value="rails_developer"> Rails Developer</option>
									<option value="web_designer">Web Designer</option>
									<option value="WordPress_developer">WordPress Developer</option>
								</optgroup>
								<optgroup label="Mobile">
									<option value="Android_developer">Androild Developer</option>
									<option value="iOS_developer">iOS Developer</option>
									<option value="mobile_designer">Mobile Designer</option>
								</optgroup>
								<optgroup label="Business">
									<option value="business_owner">Business Owner</option>
									<option value="freelancer">Freelancer</option>
								</optgroup>
								<optgroup label="Other">
									<option value="secretary">Secretary</option>
									<option value="maintenance">Maintenance</option>
								</optgroup>
					</select>
					</div>
					<div class="modal-body-line">
					<input class="form-control" id="company_number" name="company_number" 
							        type="text" placeholder="사업자 등록번호를 입력하세요"><br>
					</div>
					<div class="modal-body-line">
					<input class="form-control" id="company_addr" name="company_addr" 
							       type="text" placeholder="기업 주소를 입력하세요"><br>
					</div>
					<div class="modal-body-line">
					<input class="form-control" id="company_site" name="company_site" 
							        type="text" placeholder="기업 홈페이지 주소를 입력하세요"><br>		       
					</div>
					<textarea class="company-modalta" id="company_intro"
							          name="company_intro" placeholder="기업 소개글을 입력하세요"></textarea>
		        	</form>
				</div>
				<div class="modal-footer">
					<input type="button" name="registerBtn" id="registerBtn" value="완료">
				</div>
			</div>
		</div>
