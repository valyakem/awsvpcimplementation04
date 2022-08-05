output "dynamic-security-group-id" {
  value      = aws_security_group.security-group.id
  depends_on = [aws_security_group.security-group]
}

output "dynamic-security-group-name" {
  value      = aws_security_group.security-group.name
  depends_on = [aws_security_group.security-group]
}
