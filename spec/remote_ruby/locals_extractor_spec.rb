describe ::RemoteRuby::LocalsExtractor do
  def fetch_block(&block)
    block
  end

  it 'extracts local variables' do
    int_value = 5

    block = fetch_block {}

    extractor = described_class.new(block)
    expect(extractor.locals).to include(int_value: int_value)
  end

  # rubocop:disable Lint/UselessAssignment
  context 'with excluded types' do
    it 'ignores specified types' do
      int_value = 5
      string_value = 'A string'

      block = fetch_block {}

      extractor = described_class.new(block, ignore_types: String)
      expect(extractor.locals).to include(:int_value)
      expect(extractor.locals).not_to include(:string_value)
    end
  end
  # rubocop:enable Lint/UselessAssignment
end
